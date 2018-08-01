# [PROJECT]

[PROJECT] is a Composer-based Drupal 8 application hosted on Acquia Cloud. The application uses Acquia BLT (Build and Launch Tools) to manage local development and deployments. Acquia BLT is a set of standards, tools, and best practices recommended and supported by the Acquia Professional Services team. All site development and theming is done on a local virtual machine running Docksal.

This repository contains the project build files (composer.json, exported config, etc.), a custom theme, and any custom modules that have been added to the project. It does not contain Drupal core, vendor files, or contributed modules. This repository and its build files are used as the starting point for each build artifact and deployment.

Please review this README and be sure to understand the [core concepts and safe workflow](docs/workflow/WORKFLOW.md) described below prior to beginning. These documents are based on a Mac install and adjustments may be needed for other platforms.

## Onboarding

See the [setup documentation](docs/SETUP.md) if you are installing VirtualBox, Docksal, or Terminus for the first time. Once you meet the requirements, clone the this repository into your Docksal projects directory and initialize the site:

```cd ~/Projects```

```git clone git@github.com:electriccitizen/[SITE].git```

```cd [SITE]```

```git remote add upstream mpls@svn-6488.devcloud.hosting.acquia.com:mpls.git```

```composer install```

```fin init```

Once the site is up, you are ready to start working:

* Local: http://[SITE].docksal
* User: admin/admin (local)

You can run [fin init](docs/commands/INIT.md) any time you want to reset or guarantee that your local environment is in a safe one-to-one state with your upstream environment.

## Be a good citizen

You are working in a team environment and must follow a few rules. If you are careless, it can lead to:

* Losing all of your uncommitted work (bad)
* Overriding or losing the work of others (worse)
* Un-installable configuration or deploy errors

See this guide to [following a safe workflow](docs/workflow/WORKFLOW.md) when using configuration management in Drupal 8. The recommended workflow below follows these best practices, and includes two helper commands (```fin sync``` and ```fin validate```) that automate important components of a safe work flow.

## Recommended workflow

Here is a safe workflow that will help prevent lost work and other problems.

```fin sync``` [(?)](docs/commands/SYNC.md) to ensure your local branch and db is synced with the upstream environment before starting a new task

```git checkout -b <your-feature-branch>``` to checkout a new feature branch and do your thing

```fin drush cex``` to export your changes

```git add``` to add any new configuration, theme, or custom module files

```git commit``` to commit your changes and get your feature branch into a safe, recoverable state

```fin validate``` [(?)](docs/commands/VALIDATE.md)  to pull in changes from other team members and check your work against the upstream

```git push origin <your-feature-branch>``` to push your feature branch to Github if everything looks good

If you see errors or merge conflicts after running [fin sync](docs/commands/SYNC.md) or [fin validate](docs/commands/VALIDATE.md), you will need to work with the team to understand, fix, and commit the conflicting file(s) or other errors before continuing.

## Submit a Github pull request

Once your feature branch looks good, submit a Github pull request against your branch into master branch. A project maintainer will review the changes and merge into master.

*Note: Advanced or otherwise approved users can submit and merge their own PRs, and/or merge and push a feature branch directly into master without a formal pull request. Ask if you have questions, and err on the side of caution.*


## Deploying to Acquia dev server

Once your feature branch has been merged into master it is time to deploy a build artifact to Acquia Cloud. Make sure you are on a clean master branch, and then:

```blt deploy --branch "master-build"```

This command will create a build artifact and automatically deploy it to master-build branch of the remote Acquia repository and deploy your work directly to the Acquia dev server for review and testings.

## Tag and deploy to test or production

After you have reviewed you work on the dev server, create a new build tag so that it can be deployed to stage and production.

```blt deploy --tag "1.x.x"```

You can now deploy your build to stage and production on Acquia Cloud.

## Next steps

These documents contain other important information about the project and working with your local environment.

* [Available commands](docs/commands/COMMANDS.md)
* [Following a safe workflow](docs/workflow/WORKFLOW.md)
* [Frontend and theming documentation](docs/frontend/THEME.md)
* [Project notes](docs/custom/NOTES.md)
* [Troubleshooting](docs/local/TROUBLESHOOT.md)
* [Working with Docksal](docs/local/DOCKSAL.md)

## Support and feedback

If you need support or find any errors or suggested improvements in this README contact <tim@electriccitizen.com>.

[Back to top](#[Project])

*<small>This is an auto-generated document. Keep any custom documents in the ```custom``` folder.</small>*
