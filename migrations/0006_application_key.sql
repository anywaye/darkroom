-- +goose Up
ALTER TABLE assets ADD COLUMN IF NOT EXISTS application_key text;
CREATE INDEX IF NOT EXISTS assets_application_key_idx ON assets (application_key);

-- +goose Down
DROP INDEX IF EXISTS assets_application_key_idx;
ALTER TABLE assets DROP COLUMN IF EXISTS application_key;
