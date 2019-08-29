# IAM

Manage Data.gov sandbox access through Infrastructure as Code.


## Goals

- Manage IAM users and access using Infrastructure as Code
- Consolidate policy definitions in a single, easy to audit, location
- Manage both human users and machine accounts
- Automatically apply changes through GH workflow


## Features

- Enforce MFA on all human users
- Create machine accounts for continuous deployment
- New users can sign in with temporary password


## Usage

Changes are applied automatically through [continuous
deployment](https://circleci.com/gh/GSA/workflows/datagov-infrastructure-live).
As part of the PR review, you should check that the `iam-plan` includes only
expected changes.

The `master` branch will actually apply changes. Be sure to check the `iam-plan`
step before [approving the
workflow](https://circleci.com/gh/GSA/workflows/datagov-infrastructure-live).


### New users

Create a new user module within `users.tf`. You can copy from an existing
resource. Make sure the user is in the `developers` group which enforces MFA.

```
module "firstname_lastname" {
  source  = "./user"
  name = "firstname.lastname@gsa.gov"
  groups = ["developers"]
}
```

Once applied, log into IAM to enable console access and set a temporary password
for the user.

![Screenshot showing how to enable IAM console access](./docs/enable_new_user.png)

At this point, the user can login with the temporary password. From the AWS
console, click their username -> My Security Credentials. They will have to
enable MFA and change their password before they can do anything else.

_Note: the new user may have to sign out and back in again._


### Removing a user

Remove the user's entry from `users.tf`.


## Development


### MFA credentials

_This is a work in progress._

If you are running as an MFA user, you must first get temporary credentials.
There are many ways to do this, but here is they way we prefer.

First, copy `env.sample` to `.env`, customize it with your AWS credentials.
`AWS_MFA_DEVICE_ARN` should be set with your MFA arn. This can be found on the
"My Security Credentials" page in the AWS console.

You'll need `awscli` and `jq` installed.

    $ source .env

You'll be prompted for your MFA code. Enter it without any spaces when prompted.

These credentials are good for 12 hours.
