
### GitHub Actions: Beyond CI/CD

by *Pierre Nicolas Durette* for [*OWASP DevSlop*](https://twitter.com/Owasp_DevSlop)

*February 2020*

<i class="fab fa-twitter"></i> [pierrenick](https://twitter.com/PierreNick)<br/>
<i class="fab fa-github-alt"></i> [pndurette](https://github.com/pndurette)<br/>



### Agenda

* <span class="fragment highlight-current-blue"><i class="fas fa-search"></i> Anatomy of a GitHub Actions Workflow
* <i class="fab fa-github-alt"></i> Demo!
  * <span class="fragment highlight-current-blue"><i class="fas fa-code"></i> Building & Testing Code
  * <span class="fragment highlight-current-blue"><i class="fas fa-cloud"></i> Infrastructure-as-code and Terraform Actions
  * <span class="fragment highlight-current-blue"><i class="fas fa-tag"></i> Pull Request Labeler
  * <span class="fragment highlight-current-blue"><i class="fas fa-terminal"></i> Issue 'commands'
* <span class="fragment highlight-current-blue"><i class="fas fa-history"></i> Recap
* <span class="fragment highlight-current-blue"><i class="fas fa-external-link-alt"></i> Links



### Anotomy of a Workflow

<pre>
<code class="hljs" data-trim data-noescape data-line-numbers="1|3|5-15|6|7|9|10-11">
name: hello

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - name: Run a command
      run: echo Hello, world!
</code>
</pre>



### Demo!



### Recap

* Power to Events
* Actions: Abstract, Reuse, Share
* The Sky's the Limit!



### Resources

* My own [GitHub Actions: Beyond CI/CD](https://medium.com/slalom-build/github-actions-beyond-ci-cd-cb3ddc6abaa?source=friends_link&sk=09cc29e3333231dc14ef8fc68aa7b3d3) on Medium
* [Official Documentation](https://help.github.com/en/actions)
* [Terraform Actions by HashiCorp](https://github.com/hashicorp/terraform-github-actions)
* [GitHub Marketplace for Actions](https://github.com/marketplace?type=actions)
* Sarah Drasner's [Awesome Actions](https://github.com/sdras/awesome-actions): a list awesome things related to GitHub Actions