# diag-orb

The diag orb is intented to serve two purposes.

1. Help guide people using CircleCI to solve problems and optimize their configurations.

2. Help surface and collect information so CircleCI engineers can help solve problems.


## Usage:

Reference the orb in your config.yml. 2.1 Build Processing must be enabled on the project. Check the bottom of your `Advanced Settings` section in your project settings.

```yaml
orbs:
  diag: fernfernfern/diag@dev:volatile
```

The diag orb is intended to be applied as `pre-steps` and `post-steps` in most cases. Always include `diag/post-steps` to collect results generated in `pre-steps`.

```yaml
workflows:
  my-workflow:
    jobs:
      - my-super-neat-job:
          pre-steps:
            - diag/env-report
          post-steps:
            - diag/post-steps
```

The commands below are indended to be added as `pre-steps` for jobs you'd like to investigate.

### diag/env-report
Generate a report of various kinds of enviroment information. Helpful to find out what packages are install in the enviroment.

### diag/record-top
Start top as a background process that appends output to a file. Helpful to see memory consumption and process lifecycle over the duration of a job

### daig/sample-test-data
Create sample test junit output for Test Summary report. Helpful if you want to sanity check if test data collection is working. Pass `upload: true` to have it automatically run `store_test_results`.

```yaml
daig/sample-test-data:
  upload: true
```