# Environment Variable
|Variable|Description|Example|
|-|-|-|
|`GARAGE_KEY_ID`|Predefined S3 Key ID, must start be GK followed by 12 hex-encoded bytes. This is enforced by garage. Ignored if not used with `GARAGE_KEY_SECRET`|GKdd7c36fa3353258bd5a86304|
|`GARAGE_KEY_SECRET`|Predefined S3 secret, must be 32 hex-encoded bytes. This is enforced by garage. Ignored if not used with `GARAGE_KEY_ID`|03bee365ad0fa11c8e3438566b7afecf423aa4a59dd9069c42ce35b772094bf0|
|`GARAGE_BUCKET_NAME`|S3 Bucket name, default to `local`, naming rules foloow [aws bucket naming rules](https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html).|bucket|
|`GARAGE_REGION`|S3 Region name, default to `garage`|ap-southeast-2|
|`GARAGE_CAPACITY`|Storage capacity, default to `1G`|10G|

If not using predefined key, you can find the generate key in the container log.

# TODO

- [ ] docker secret for key
- [ ] Env config (rpc secret, not sure what it does so gonna leave it for now)
- [ ] Use proper healthcheck
