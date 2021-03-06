# Restore

Thankfully with velero we can easily restore a complete application back to the point from when it was backed up.

`velero restore create --from-backup nginx-backup`{{execute}}

`velero restore get`{{execute}}

> Note: The restore can take a few moments to finish. During this time, the STATUS column reads InProgress.

After a successful restore, the STATUS column is Completed, and WARNINGS and ERRORS are 0.

All objects in the nginx-example namespace should be just as they were before you deleted them.

> Note: If there are errors or warnings, you can look at them in detail `velero restore describe <RESTORE_NAME>`.
