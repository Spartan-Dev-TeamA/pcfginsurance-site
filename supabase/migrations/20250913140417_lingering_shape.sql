/*
  # Create contact forms table

  1. New Tables
    - `contact_forms`
      - `id` (uuid, primary key)
      - `first_name` (text)
      - `last_name` (text)
      - `email` (text)
      - `phone` (text)
      - `state` (text)
      - `company` (text)
      - `insurance_type` (text)
      - `industry` (text)
      - `message` (text)
      - `preferred_contact` (text)
      - `tag` (text)
      - `created_at` (timestamp)
      - `updated_at` (timestamp)

  2. Security
    - Enable RLS on `contact_forms` table
    - Add policy for public insert
    - Add policy for authenticated read
*/

CREATE TABLE IF NOT EXISTS contact_forms (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  first_name text,
  last_name text,
  email text,
  phone text,
  state text,
  company text,
  insurance_type text,
  industry text,
  message text,
  preferred_contact text DEFAULT 'either',
  tag text DEFAULT 'contact',
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

ALTER TABLE contact_forms ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow public insert on contact_forms"
  ON contact_forms
  FOR INSERT
  TO anon
  WITH CHECK (true);

CREATE POLICY "Allow authenticated read on contact_forms"
  ON contact_forms
  FOR SELECT
  TO authenticated
  USING (true);