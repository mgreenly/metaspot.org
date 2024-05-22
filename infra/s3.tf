resource "aws_s3_bucket" "dnd" {
  bucket = "dnd.metaspot.org"
}

data "template_file" "s3_policy" {
  template = file("${path.module}/policy_s3_public.tpl")

  vars = {
    bucket_name = aws_s3_bucket.dnd.id
  }
}

resource "aws_s3_bucket_public_access_block" "dnd" {
  bucket = aws_s3_bucket.dnd.id

  block_public_acls   = false
  block_public_policy = false
}

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.dnd.id
  policy = data.template_file.s3_policy.rendered
}

