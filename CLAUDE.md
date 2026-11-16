# MyResume

Rails 8 API (Ruby 3.4, PostgreSQL) serving a personal resume as REST (JSON/XML) and GraphQL. Deployed on Heroku (`my-resume-api`). See `README.md` for the human-oriented dev notes.

## Environment / database

- `config/database.yml` reads `RDS_USERNAME`, `RDS_PASSWORD`, `RDS_HOSTNAME`, `RDS_PORT`, `RDS_DB_NAME` from the environment. Nothing works (rspec, rails runner, rake) until they are exported.
- The env vars come from gitignored scripts in `scripts/` (`source-nonprod.sh`, `source-prod.sh`; the README says `source.sh`, which does not exist). Run `source ./scripts/source-nonprod.sh` in the same shell before any Rails command. Do not print or commit these files; they hold credentials. Each Bash call is a fresh shell, so chain it: `source ./scripts/source-nonprod.sh && bundle exec rspec`.
- If a command fails with `PG::ConnectionBad ... /var/run/postgresql/.s.PGSQL.5432`, the env vars are missing, not Postgres down.
- The `test` DB is `myresume_test`. Never point it at the dev/prod DB: Rails may erase it. Reset with `bundle exec rails db:reset RAILS_ENV=test` (schema load plus seed).
- Specs depend on seeded data (e.g. `Person.find_by_name('Carlos Sola-Llonch')`, resume id 1), so the test DB must be seeded. `use_transactional_fixtures` is on, so records created inside examples roll back.
- Needs the `uuidgen` binary (`apt-get install uuid-runtime`).

## Commands

- All specs: `bundle exec rspec` (or `bin/rspec`)
- Only rswag/API-doc examples: `RAILS_ENV=test bundle exec rspec --tag rswag`
- Regenerate `swagger/v1/swagger.yaml`: `RAILS_ENV=test bundle exec rake rswag:specs:swaggerize`. The task is only registered under `RAILS_ENV=test` (`rswag-specs` is in the test/dev Gemfile group).
- Dev server, plain API: `bundle exec rails s -b 0.0.0.0 -p 3001`
- Dev server for GraphQL (needs https, host must be `localhost`): `bundle exec rails s -b ssl://localhost:3001`; endpoint `https://localhost:3001/graphql`
- Deploy: `git push heroku main`. Heroku deploys whatever is committed on `main`, so commit first. The prod DB is loaded with `heroku run rails db:schema:load DISABLE_DATABASE_ENVIRONMENT_CHECK=1` then `db:seed`.

## Layout

- `app/controllers/api/v1/`: REST controllers (`person_controller.rb`, `resume_controller.rb`), base class `application_controller.rb` with `send_response` (renders JSON or XML based on format).
- `config/routes.rb`: routes are hand-written, not resourceful. Person actions are `get 'person/:uuid/:action'`, so adding a public action to `PersonController` exposes it at `/api/v1/person/:uuid/<action>`. Collection routes go before the `:uuid/:action` catch-all. `PersonController` has `before_action :get_person` (looks up by uuid), so skip it for actions without a uuid. `ResumeController` looks up the resume by id for every action.
- `app/models/`: `Person` -> `Resume` -> `Role` (a job) -> `Project` -> `Accomplishment`/`Tag`/`App`; `Role` belongs to `Company`; `Certificate` belongs to `Person`. The REST API and docs call roles "jobs".
- `app/graphql/`: GraphQL schema and types. `ResumeType#jobs` reuses `Role.since`, so changing that scope changes REST and GraphQL together.
- `lib/errors.rb`: custom errors (`PersonNotFound`, `ResumeNotFound`, `JobsNotFound`, ...) that controllers `rescue_from` and map to a 404 with an empty body.
- `db/*_seeds.rb`: seed data for the resume content.
- `postman/`: Postman collection for the API.

## Testing conventions

- Controller specs: `spec/controllers/v1/`. Model specs: `spec/models/`. Request specs (`spec/requests/api/v1/`) use rswag, and **they are the source of `swagger/v1/swagger.yaml`**.
- When adding or changing an endpoint, update the controller, the route, a request spec (so docs generate), and any controller or model specs. Then regenerate the swagger yaml. If the DB isn't reachable, hand-edit the yaml to match what rswag would emit and say so.
- The `since` query on `/resume/:id/jobs` takes `mm/dd/yyyy` and returns roles that started on or after it, or were still active on it (`end_date` null means current).

## Working notes

- Commit messages and PRs follow the attribution rules in the session. There is a Claude PR Assistant workflow in `.github/workflows/claude.yml`.
- Pushing to `origin` (GitHub) and to `heroku` are separate steps. Don't deploy unless asked.
