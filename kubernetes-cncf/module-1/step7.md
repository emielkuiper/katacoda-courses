There are many other repos that you can add to Helm. If your chart is in a Github account, the location can be registered to Helm so it can pull the chart from that source.

## Incubator Charts ##

There are also dozens of public incubator charts. Add the `incubator` repo.

`helm repo add incubator https://kubernetes-charts-incubator.storage.googleapis.com/`{{execute}}

Explore the incubating charts. Last time we checked there were 66 incubating charts, many of them deprecated as they progressed to stable. How many are there now?

`helm search | grep -c 'incubator/'`{{execute}}

The [source repos for the incubators are here.](https://github.com/helm/charts/tree/master/incubator)

What about creating your own chart? In the next step, let's create a chart.
