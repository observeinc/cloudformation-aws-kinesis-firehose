S3_CP_ARGS=aws s3 cp --acl public-read

.PHONY: cloudformation
cloudformation:
	$(S3_CP_ARGS) templates/firehose.yaml s3://observeinc/cloudformation/firehose-`semtag final -s minor -o`.yaml
	$(S3_CP_ARGS) templates/firehose.yaml s3://observeinc/cloudformation/firehose-latest.yaml

.PHONY: changelog
changelog:
	git-chglog -o CHANGELOG.md --next-tag `semtag final -s minor -o`

.PHONY: release
release: cloudformation
	semtag final -s minor
