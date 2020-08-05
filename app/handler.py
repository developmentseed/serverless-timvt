"""AWS Lambda handler."""

from mangum import Mangum

from .app import app

handler = Mangum(app, enable_lifespan=False, log_level="error")
