from twelve_factor_app_framework.bootstrap import app
from views.first_service import home, demo

app.add_endpoint(['GET'], "/", "home", home)
app.add_endpoint(['GET'], "/virtual", "demo", demo)
