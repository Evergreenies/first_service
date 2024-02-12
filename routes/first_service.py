from twelve_factor_app_framework.bootstrap import app
from views.first_service import home, demo

app.add_endpoint("/", "home", home)
app.add_endpoint("/virtual", "demo", demo)
