.PHONY: cloudformation
cloudformation:
	aws s3 cp templates/firehose.yaml s3://observeinc/cloudformation/firehose-`semtag final -s minor -o`.yaml
	aws s3 cp templates/firehose.yaml s3://observeinc/cloudformation/firehose-latest.yaml

.PHONY: changelog
changelog:
	git-chglog -o CHANGELOG.md --next-tag `semtag final -s minor -o`

.PHONY: release
release: cloudformation
	semtag final -s minor
