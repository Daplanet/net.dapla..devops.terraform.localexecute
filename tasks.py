#!/usr/bin/env python3
from os import getenv
from pyinvoke import task
from docker import Client

@task(default=True)
def build(ctx, image_name='ghcr.io/Daplanet/terraform-localexecute:latest'):
  """
  Builds base docker image and pushes to <image_name>
  """
  
  try:
    
    cli = Client(base_url="unix:///var/run/docker.sock")

    cli.login(registry=image_name.split('/',1)[0], user="denzuko", password=getenv('GITHUB_TOKEN'))
    cli.build(path='.', tag=image_name)
    cli.push(image_name)
    
  except Exception as err:
    print(err)
    sys.exit(1)
    
  finally:
    del(cli)

@task
def help(ctx):
  ctx.run("invoke --list")
