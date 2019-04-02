## An Overview of <!-- .element: style="margin-bottom: 0; padding-top: 0" -->  
# Spinnaker       <!-- .element: style="margin-top: -0.3em; padding-top: 0; color: #4699B1" -->  

Pierre Nicolas Durette<br/>*DevOps Toronto April 2019 *

<br/>
<i class="fab fa-twitter"></i> [pierrenick](https://twitter.com/PierreNick)<br/>
<i class="fab fa-github-alt"></i> [pndurette](https://github.com/pndurette)<br/>
<i class="fab fa-linkedin"></i> [pndurette](https://www.linkedin.com/in/pndurette/) 

Note:
Meant to be a quick intro, won’t go into internals, but show you the cool stuff. -->



# About me

<p>
<i class="fas fa-hand-peace"></i> Hello!<br/> 
<i class="fas fa-tag"></i> Pierre Nicolas Durette<br/> 
<i class="fas fa-hourglass-half"></i> 10 years DevOps-y & delivery<br/> 
<i class="fas fa-expand-arrows-alt"></i> Worked at big & small<br/>
<i class="fas fa-globe-americas"></i> Travel, tech, touch screens<br/>
<i class="fas fa-bone"></i> Schnauzer
</p> <!-- .element: style="float: right; width: 60%; text-align:left" -->

![PN](content/me.jpg "PN")  <!-- .element: class="plain"; style="width: 30%; " -->



# What is Spinnaker?

![Spinnaker Logo](content/spinnaker.png "Spinnaker Logo") <!-- .element: class="plain" -->


*<i class="fas fa-quote-left"></i> Spinnaker is an open source, multi-cloud continuous delivery platform for releasing software changes with high velocity and confidence. <i class="fas fa-quote-right"></i>* – [spinnaker.io](https://www.spinnaker.io) 


## Timeline
- 2010: Netflix creates Asgard
- 2012: Netflix open-sources Asgard
- 2014: Netflix creates Spinnaker
- **2015: Netflix open-sources Spinnaker (AWS & GCP)**  <!-- .element: style="color: #4699B1" --> 

Note:
* Asgard (AWS)
  * AWS Console wasn't mature 
  * Manage dev access (instead of keys)
  * Forked for other clouds
  * No CD workflow
* Spinnaker (AWS & GCP at launch)
  * Multicloud
  * CD Pipelines
  * 'Baking'


## 2019: Supported platforms

<span class="fragment fade-in-then-semi-out">Amazon Web Services (EC2,</span>
<span class="fragment fade-in-then-semi-out">ECS,</span>
<span class="fragment fade-in-then-semi-out">Lambda), </span>
<span class="fragment fade-in-then-semi-out">Azure (VM), </span>
<span class="fragment fade-in-then-semi-out">Cloud Foundry </span>
<span class="fragment fade-in-then-semi-out">(e.g. IBM Cloud),</span>
<span class="fragment fade-in-then-semi-out">DC/OS,</span>
<span class="fragment fade-in-then-semi-out">Google Cloud Platform (Compute,</span>
<span class="fragment fade-in-then-semi-out">AppEngine), </span>
<span class="fragment fade-in-then-semi-out">Kubernetes (any),</span>
<span class="fragment fade-in-then-semi-out">OpenStack,</span>
<span class="fragment fade-in-then-semi-out">Oracle Cloud</span>


## Two Core Feature Sets


### 1. Infrastructure<br/>(Application Management)

* View all clouds, accounts & regions<br/>for an application, at a glance <!-- .element: class="fragment" data-fragment-index="1" -->
* Contextual management replaces consoles<br/>of each individual cloud <!-- .element: class="fragment" data-fragment-index="2" -->
* Infrastructure state is not stored,<br/>it is read from each cloud <!-- .element: class="fragment" data-fragment-index="3" -->


<!-- .slide: data-background-color="white" data-background-image="content/spinnaker-clusters_example.png"-->
## <i class="fas fa-exclamation-circle"></i> Old screenshot <!-- .element: style="margin-top: 2.5em;" -->


### 2. Pipelines<br/>(Application Deployment)

* Create and manage delivery workflow pipelines <!-- .element: class="fragment" data-fragment-index="1" -->
* Provides CD, not CI; integrates with CI systems  <!-- .element: class="fragment" data-fragment-index="2" -->
* Pipeline-as-code <!-- .element: class="fragment" data-fragment-index="3" -->
* Pipeline templates <!-- .element: class="fragment" data-fragment-index="4" -->


<!-- .slide: data-background-color="white" data-background-image="content/spinnaker-pipelines_example.png"-->
## <i class="fas fa-exclamation-circle"></i> Old screenshot <!-- .element: style="margin-top: 3em;" -->



# Infrastructure


<!-- .slide: data-background-color="white" -->
![Spinnaker Diagram](content/diagram.png "Spinnaker Diagram") <!-- .element: class="plain" style="margin-top: -0.2em;" -->
<p style="font-size: 0.5em; margin-top: -7em;">Source: https://www.spinnaker.io/concepts/</p>

Note:
  * Spinnaker only stores Applications (and projects) the rest = read from cloud


## Multi-Cloud Abstractions

| Spinnaker | AWS | GCP | Azure | Kubernetes |
|-----------|-----|-----|-------|------------|
| **Server Group** | Auto Scaling Group | Managed Instance Group | Virtual Machine Scale Set | 'Workload' (Deployment, StatefulSet, DaemonSet, etc.) | 
| **Instance** | Instance | VM | VM | Pod |
<!-- .element: style="margin-left: -2.5em;" -->


## Multi-Cloud Abstractions (cont.)

| Spinnaker | AWS | GCP | Azure | Kubernetes |
|-----------|-----|-----|-------|------------|
| **Load Balancer** | Load Balancer | Load Balancer | Application Gateway | Service |
| **Firewall** | Security Group | Firewall | Network Security Group | NetworkPolicy |
| **Region** | Region | Region | Region | Namespace |
<!-- .element: style="margin-left: -2.5em;" -->


## Operations

Deploy • Destroy • Resize • **Rollback** • Terminate • **Terminate Instance and Shrink Server Group** • Enable & Disable Server Group • Create Load Balancer • Edit Inbound Rules ..

*(Not all cloud providers implement all operations)*


## Convention over configuration

Best Practices — Very opinionated, in a good way.


### Clusters

An application in a specific **cloud account** & **region**

naming: `application[-stack-detail]` <!-- .element: style="color: #4699B1" -->  

* **application** — Application name
* **stack** — User defined logical group (e.g. prod, dev)
* **detail** — An extra user defined group

Examples:
* "`myapp-stg-spot` in AWS/us-east-1"
* "`myapp-prod` in Azure/US West"

Note:
  * On k8s: annotation instead
  * For imported apps, possible to use cloud tags for app/stack/detail


<!-- .slide: data-background-color="white" -->
![Spinnaker Diagram](content/diagram.png "Spinnaker Diagram") <!-- .element: class="plain" style="margin-top: -0.2em;" -->
<p style="font-size: 0.5em; margin-top: -7em;">Source: https://www.spinnaker.io/concepts/</p>



# Pipelines


## Concepts


### Triggers (examples)

* Jenkins, Travis, Wercker, GCP Cloud Build <!-- .element: class="fragment" data-fragment-index="1" -->
  * Passes data/metadata that can be used <!-- .element: class="fragment" data-fragment-index="1" -->
* Docker Registry Change <!-- .element: class="fragment" data-fragment-index="2" -->
  * Can also do regex match on tag <!-- .element: class="fragment" data-fragment-index="2" -->
* GCP Pub/Sub <!-- .element: class="fragment" data-fragment-index="3" -->
* Webhook <!-- .element: class="fragment" data-fragment-index="4" -->
* Another pipeline <!-- .element: class="fragment" data-fragment-index="5" -->
* GitHub, GitLab, BitBucket <!-- .element: class="fragment" data-fragment-index="6" -->
* CRON <!-- .element: class="fragment" data-fragment-index="7" -->


### Steps (examples)

* Jenkins <!-- .element: class="fragment" data-fragment-index="1" -->
  * Can trigger jobs as a step and wait (or not) for completion <!-- .element: class="fragment" data-fragment-index="1" -->
* Bakery <!-- .element: class="fragment" data-fragment-index="2" -->
  * 'Bake' machine images (using HashiCorp Packer) <!-- .element: class="fragment" data-fragment-index="2" -->
  * 'Render' Helm charts (for Kubernetes) <!-- .element: class="fragment" data-fragment-index="2" -->
* Deploy <!-- .element: class="fragment" data-fragment-index="3" -->
  * Strategies e.g. Blue/Green, Rolling, Canary.. <!-- .element: class="fragment" data-fragment-index="3" -->
* Any cloud operation (contextual to provider) <!-- .element: class="fragment" data-fragment-index="4" -->
  * Disable cluster, Shrink cluster.. <!-- .element: class="fragment" data-fragment-index="4" -->
* Manual Judgement <!-- .element: class="fragment" data-fragment-index="5" -->


<!-- .slide: data-background-color="white" data-background-image="content/pipeline_newer_example.png" data-background-size="contain" -->


### Pipeline Expressions

An extremely powerful expression language (SpEL) that can be used in almost any text field, with auto-completion.

Note:
Spring Expression Language (SpEL).


#### Functions

![Helper Functions](content/helper-func-autocomplete.png "Helper Functions") <!-- .element: class="plain" style="margin-top: -0.2em;" -->


#### Properties

![Helper Properties](content/helper-properties-list.png "Helper Properties") <!-- .element: class="plain" style="margin-top: -0.2em;" -->


### Everything is 'as-code'

* Pipelines can be designed in the UI<br/>and saved as JSON.
* The `spin` CLI tool provides pipeline<br/>CRUD + Run operations


## Pipeline Templates

[Very new (2019)](https://blog.spinnaker.io/spinnaker-managed-pipeline-templates-v2-taking-shape-c7503d0a608d) Pipeline Template v2 schema:

1. Create a template in the UI
2. Download it with `spin pipelines get`
3. Replace the desired parts with variables using the same Pipeline Expression Language
4. Submit with `spin pipeline-templates save`

Still a WIP (but very promising):
  * Spinnaker is gearing towards the [jsonnet](http://jsonnet.org/) data templating language. See [examples](https://github.com/spinnaker/spinnaker/tree/master/sponnet).



# The Project


## Governance

<!-- .slide: data-background-color="white" -->
* **October 2018:** Governance structure announced
* **March 2019:** Spinnaker joins new Continuous Delivery Foundation as founding project! https://cd.foundation

![CDF logo](content/cd_foundation_logo.png "CDF logo") <!-- .element class="plain" style="width:20%; margin:0;" -->
![CDF Projects](content/cd_foundation_projects.png "CDF Projects") <!-- .element: class="plain" -->


## Installing

* Ubuntu VM <i class="fab fa-ubuntu"></i>
* Kubernetes (Helm Chart) <i class="fas fa-anchor"></i>
* *spinnaker-playground* <i class="far fa-hand-peace"></i><br/>https://github.com/pndurette/spinnaker-playground<br/>Local lightweight install — by me!



# Thank you! <!-- .element: style="color: #4699B1" --> 
# Questions<br/><i class="fas fa-question"></i>



# Appendix


## Community & Talks

* https://www.spinnaker.io
* [O'Reilly eBook](https://www.spinnaker.io/publications/ebook/)
* Talks:
  * [Spinnaker Summit 2018](https://www.youtube.com/playlist?list=PL4yLrwUObNksZ8svJWu5HOHT3e_dpa5Ih)
  * [Google Cloud Next '18](https://youtu.be/PLNheBiWOGI)
  * [More!](https://www.spinnaker.io/publications/presentations/)
* Community:
  * [Slack](http://join.spinnaker.io/)
  * [Spinnaker Project Blog](https://blog.spinnaker.io)
  * [GitHub](https://github.com/spinnaker)


## Reference

* [Halyard (`hal`)](https://www.spinnaker.io/reference/halyard/commands/): Spinnaker configuration CLI
* [`spin`](https://www.spinnaker.io/guides/spin/): Application, Pipeline & Pipeline Template CLI
* [Pipeline Expression Language](https://www.spinnaker.io/reference/pipeline/expressions/)


## Releases

* [Versions](https://www.spinnaker.io/community/releases/versions/) & Changelogs
* [Roadmap](https://www.spinnaker.io/community/releases/roadmap/)


## More topics to explore:

* Image Bakery
* Canary support 
* Chaos Engineering
* Authentication & Authorization
* Kubernetes Custom Resource Definitions (CRDs)
* Custom Webhook Pipeline Stages
* Jenkins integration w/ artifact support
* Monitoring: Datadog, Prometheus, Stackdriver
* Notifications
* User Data