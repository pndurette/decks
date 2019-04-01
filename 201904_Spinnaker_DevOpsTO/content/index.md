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

Note:
	1. What I do
	2. Links



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


## 2019: Suported platforms

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


## Two Core Features Sets

### Infrastructure (Application Management)

<span class="fragment fade-in-then-semi-out">View all clouds, accounts & regions for an app at-a-glance. </span>
<span class="fragment fade-in-then-semi-out">Contextual management replaces the consoles of each cloud. </span>
<span class="fragment fade-in-then-semi-out">Spinnaker doesn't store infrastructure state, it reads it from the clouds. </span>

### Pipelines (Application Deployment)

<span class="fragment fade-in-then-semi-out">Create and manage delivery workflow pipelines. </span>
<span class="fragment fade-in-then-semi-out">CD, not CI: integrate with CI.  </span>
<span class="fragment fade-in-then-semi-out">Pipeline-as-code, templating. </span>



# Infrastructure


## Concepts

|Spinnaker|AWS|GCP|Azure|Kubernetes|
|--|--|--|--|--|
|a|b|c|d|e|

Note:
	1. Convention over configuration
	2. Project, Application
	3. Abstractions between clouds
		1. Account
		2. Region
		3. Instance
		4. Load Balancers
		5. Firewalls
	4. Stack, Detail
    	4. Best Practices — Very opinionated, in a good way
		1. Deployment strategies 




# Infrastructure

Note:
	1. (Can replace having to go to many consoles or kubectl)
	2. Clusters
	3. Load Balancers
	4. Firewall



# Pipelines

As of early 2019:

roer (v1)
spin (v2)
heading towards Jsonet 
https://github.com/spinnaker/spinnaker/tree/master/sponnet

Note:
	1. Steps
		1. Bakery
		2. Deploy
	2. SpEL



# Production-ize


Auth/Authz
Metrics / Logging
Scaling


# Installing



Note:
	1. Installation ways
	2. (Included a playground!)




# Governance

New CD foundation

Dev is fast and things change, docs don't always follow (esp. in template/pipelines)


# Thank you!
# Questions?


# Appendix

Note:
	1. Microservices
	2. API
	3. App control management
	4. Deploy strategies
	5. Canaries
    halyard reference
    spin reference

    Videos:
        Google Cloud Next '18: Large-Scale Continuous Delivery at Netflix and Waze Using Spinnaker:
        https://cloud.withgoogle.com/next18/sf/sessions/session/155951

# Screenshots