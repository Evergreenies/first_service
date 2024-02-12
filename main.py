from twelve_factor_app_framework.bootstrap import app
from routes import demo, home  # noqa

if __name__ == "__main__":
    app.run()
