# remote-batch

We'll discuss motivations for using remote servers (statcomp, ACCRE) to run R code in non-interactive mode. Various tips including how to develop code on another machine, accessing remote files, debugging errors, and avoiding the dreaded "Broken pipe" (lost SSH connection) message.

## Why?

Presumably you have a big job.  It will take a long time and your computer has limited resources.
There is a big difference between RAM/memory and CPU/processor.
You need RAM for big data, you need CPU for parallel processing.
Additionally even a small job running on someone else's machine frees up resources for you to play video games or watch Netflix on your machine.

## A Security Warning

Don't put PHI/PII on a remote server.  I don't know the policy for ACCRE or AWS, but we do not claim to protect your data on statcomp.

## Some Commands to Know

* ssh

&lt;spoiler>-o ServerAliveInterval=240&lt;/spoiler>

* ssh-keygen
* ssh-add
* scp
* tmux
* Rscript
* sh
* top
* `ps aux | grep run.R`

[Wiki FAQ](https://biostat.app.vumc.org/wiki/Main/FrequentlyAskedQuestionsFAQ#How_do_I_run_my_R_program_as_a_batch_job_63)

* nohup
* at now

### Windows Users

* putty
* winscp

## A Prime Example

If your search for infinite many prime numbers is divided by infinite many processors, you'll find them infinitely faster, right?

<table>
<tr><td>script</td><td>things you'll learn</td></tr>
<tr><td>primes1.R</td><td>normal script</td></tr>
<tr><td>primes2.R</td><td>command-line arguments</td></tr>
<tr><td>primes3.R</td><td>save output</td></tr>
<tr><td>runBatch.sh</td><td>multi-tasking and redirecting output</td></tr>
</table>

## A Simulating Example

<table>
<tr><th colspan='2'></th><th colspan='2'>Case</th><th rowspan='2'>Odds Ratio</th></tr>
<tr><th></th><th>Exposure</th><th>0</th><th>1</th></tr>
<tr><td rowspan='2'>Scenario 1<br/>x1-x80</td><td>0</td><td>0.9</td><td>0.1</td><td rowspan='2'>1</td></tr>
<tr><td>1</td><td>0.9</td><td>0.1</td></tr>
<tr><td rowspan='2'>Scenario 2<br/>x81-x95</td><td>0</td><td>0.9</td><td>0.1</td><td rowspan='2'>6</td></tr>
<tr><td>1</td><td>0.6</td><td>0.4</td></tr>
<tr><td rowspan='2'>Scenario 3<br/>x95-x100</td><td>0</td><td>0.9</td><td>0.1</td><td rowspan='2'>21</td></tr>
<tr><td>1</td><td>0.3</td><td>0.7</td></tr>
</table>

<table>
<tr><td>script</td><td>things you'll learn</td></tr>
<tr><td>exposure1.Rnw</td><td>normal script</td></tr>
<tr><td>runKnit.sh</td><td>convenience script to knit</td></tr>
<tr><td>gendata.R</td><td>isolate data manipulation</td></tr>
<tr><td>exposure2.Rmd</td><td>code branching</td></tr>
<tr><td>run.R</td><td>convenience script to knit</td></tr>
</table>

## tmux (replacment for screen)

Start a job within a tmux session, detach, and log off.  Come back later and attach the session.

* tmux ls

### Outside of a session

* tmux new
* tmux attach-session -t 1

### Inside of a session

* exit
* ctrl+b, [command]
* ctrl+b, d (detach)
* ctrl+b, s (select session)
