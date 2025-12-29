# Job Manager

The central dashboard of Cadify Service is called **Job Manager**, and can be accessed through the **context menu**. It is a resizable window with all job information and action buttons. The job list is paginated to avoid loading and displaying too much data. The Job Manager window is accessible when the service is not running.

![Cadify Service Job Manager window](./images/09-job-manager.jpg)

> The Job Manager loads data stored in an SQLite database file in Cadify's data folder (usually `C:\Cadify\Configuration`) called `queue.db`. If the service gets soft-locked due to any issue with the database file, it gets backed up and recreated automatically. Old DB files are preserved.

## Job list

The Job Manager's main GUI element is the job list showing active and past jobs in a tabular view. Every row is a separate job, not necessarily completed by the current Cadify Service. Every item has the following properties on display:

- **Store URL**: The URL of the Cadify Web store the job is originating from.
- **Product**: The product's name in the Cadify Web store the job must create a new configuration instance for.
- **SKU**: The product's SKU in the Cadify Web store the job must create a new configuration instance for.
- **User**: The requesting user's name and email address in Cadify Web.
- **IP**: The requesting user's IP address.
- **Created**: The UTC timestamp of the moment the requesting user made the job request.
- **Status**: The current status of the job with the elapsed time if the job's generation process has been started.
- **Priority**: An integer indicating the priority of the current job amongst all jobs in the queue. High-priority jobs are started before jobs with lower priority values.

Jobs can take the following states depending on various factors:

- **In Queue**: The job has been registered, but not started yet.
- **Other Service**: The job has been started by another Cadify Service before this one could start it.
- **Cancelled**: The job has been cancelled either from the Cadify Service or from the Cadfiy Web product page.
- **Running**: The job has been started by this Cadify Service.
- **Finished**: The job has been finished successfully.
- **Error**: The job has been finished with an error. Please check the logs for more details.

> All Cadify desktop components save logs to the local Cadify log folder (usually `C:\Cadify\Logs`). Logs are rotated regularly, but they are not compressed or archived. Every log file can be opened with a text editor. The modification dates of log files can help in tracking down erroneous jobs. Error logs are separated from the rest.

## New jobs

When a generation request is made on Cadify Web, connected Cadify Service applications enqueue it as a new job. Before changing to a closed state (**other service**, **cancelled**, **finished**, **error**), action buttons are available for the job:

![New item in Job Manager](./images/10-new-job.jpg)

There are three action buttons operators can use to control how Cadify Service treats the job:

- **Authorize**: marks the job as runnable. For more information, please read the [Authorization](./auth.md) page.
- **Set Next**: raises the priority of the job above the current highest priority.
- **Cancel**: marks the job as cancelled to prevent it from running.

> Cancellation affects every Cadify Service. If an operator cancels a job from Cadify Service, other Cadify Service applications connected to the same store shortly detect the cancellation and mark the job as cancelled as well. Cadify Web also conveys the fact of cancellation to the requesting customer.
