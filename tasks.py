#!/usr/bin/env python3
from os import getenv
from pyinvoke import task
from docker import Client

@task(default=True)
def build(ctx):
  cli = Client(base_url="unix:///var/run/docker.sock")
  try:
    cli.login(registry="ghcr.io", user="denzuko", password=getenv('GITHUB_TOKEN'))
    cli.build(path='.', tag="ghcr.io/Daplanet/terraform-localexecute:latest")
  except Exception as err:
    print(err)
    sys.exit(1)
  finally:
    del(cli)
