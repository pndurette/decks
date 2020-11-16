
## Introduction to GitHub Actions

<i class="fas fa-id-card-alt"></i> <strong>Pierre-Nicolas Durette</strong><br/><br/>
<i class="fab fa-twitter"></i> [pierrenick](https://twitter.com/PierreNick)<br/>
<i class="fab fa-github-alt"></i> [pndurette](https://github.com/pndurette)<br/>



### Agenda

* <i class="fas fa-search"></i> Anatomy of a GitHub Actions Workflow
* <i class="fas fa-shoe-prints"></i> Workflow Steps
* <i class="fas fa-running"></i> Real-World Example Workflow
* <i class="fas fa-external-link-alt"></i> Resources



### Anatomy of a Workflow

<pre>
<code class="hljs" data-trim data-noescape data-line-numbers="|1|2|4-13|5|6|7|8|9-12">
name: Greeting
on: push

jobs:
  hello:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Run a command
      run: echo Hello World!
</code>
</pre>



### Two types of `steps`


1. `run:` Run a shell command

```yaml
- run: <command> 
```

Example: <!-- .element: class="fragment" data-fragment-index="1" -->

<pre>
<code class="hljs plaintext" data-trim data-noescape>
- run: echo Hello World!
</code>
</pre> <!-- .element: class="fragment" data-fragment-index="1" -->


2. `uses:` Use an _action_

```yaml
- uses: <user>/<repo>@<version>
```
Example: <!-- .element: class="fragment" data-fragment-index="1" -->

<pre>
<code class="hljs plaintext" data-trim data-noescape>
- uses: <span class="fragment highlight-current-red" data-fragment-index="3">actions/checkout</span><span class="fragment highlight-red" data-fragment-index="4">@v2</span>
</code>
</pre> <!-- .element: class="fragment" data-fragment-index="1" -->

Source: <!-- .element: class="fragment" data-fragment-index="2" -->
<pre>
<code class="hljs plaintext" data-trim data-noescape>
https://github.com/<span class="fragment highlight-current-red" data-fragment-index="3">actions/checkout</span>
</code>
</pre> <!-- .element: class="fragment" data-fragment-index="2" -->



### Workflow: Real-World Example
Testing a Python package

<pre>
<code class="hljs" data-trim data-noescape data-line-numbers="1|3-7|4|5-7|9|10|12|14|16|18|19-20|22-25|27-28">
name: Unit Tests

on:
  push:
  pull_request:
    branches:
      - main

jobs:
  test:

    runs-on: ubuntu-latest

    steps:

    - uses: actions/checkout@v2

    - uses: actions/setup-python@v2
      with:
        python-version: 3.9

    - name: Install
      run: |
        pip install --upgrade pip
        pip install --upgrade .

    - name: Unit Tests
      run: pytest
</code>
</pre>



### Resources

* My own [GitHub Actions: Beyond CI/CD](https://medium.com/slalom-build/github-actions-beyond-ci-cd-cb3ddc6abaa?source=friends_link&sk=09cc29e3333231dc14ef8fc68aa7b3d3) on Medium
* [Official Documentation](https://docs.github.com/en/free-pro-team@latest/actions)
* [`setup-terraform` Action by HashiCorp](https://github.com/hashicorp/setup-terraform)
* [GitHub Marketplace for Actions](https://github.com/marketplace?type=actions)
* Sarah Drasner's [Awesome Actions](https://github.com/sdras/awesome-actions): a list awesome things related to GitHub Actions