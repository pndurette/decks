# Infra

Hosting is on AWS S3.

### 1. Create S3 bucket

```bash
$ terraform init
$ terraform apply
```

*NB*: The `pn-tf-state` bucket must exist in the `ca-central-1` region and be accessible (by me).

This will:

* Create the `decks.pierre-nick.com` (for CNAME match) bucket in `ca-central-1` region;
* Set it as a "static web hosting" with the index document set to `index.html`

### 2. Upload a deck

```bash
$ DECK_DIR=some_deck_dir
$ aws s3 sync $DECK_DIR s3://cv.pierre-nick.com/$DECK_DIR 
```

### 3. Configure DNS

Add a `CNAME` record to the `pierre-nick.com` DNS zone:

(*NB*: the domain to CNAME to is outputted by `terraform apply` above)