/*
  # Create claim reports table

  1. New Tables
    - `claim_reports`
      - `id` (uuid, primary key)
      - `policy_number` (text)
      - `insured_name` (text)
      - `claim_type` (text)
      - `loss_date` (date)
      - `loss_time` (time)
      - `loss_location` (text)
      - `loss_description` (text)
      - `injuries` (boolean)
      - `police_report` (boolean)
      - `contact_phone` (text)
      - `tag` (text)
      - `created_at` (timestamp)
      - `updated_at` (timestamp)

  2. Security
    - Enable RLS on `claim_reports` table
    - Add policies for public insert and authenticated read
*/

CREATE TABLE IF NOT EXISTS claim_reports (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  policy_number text,
  insured_name text,
  claim_type text,
  loss_date date,
  loss_time time,
  loss_location text,
  loss_description text,
  injuries boolean DEFAULT false,
  police_report boolean DEFAULT false,
  contact_phone text,
  tag text DEFAULT 'claim-report',
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

ALTER TABLE claim_reports ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow public insert on claim_reports"
  ON claim_reports
  FOR INSERT
  TO anon
  WITH CHECK (true);

CREATE POLICY "Allow authenticated read on claim_reports"
  ON claim_reports
  FOR SELECT
  TO authenticated
  USING (true);