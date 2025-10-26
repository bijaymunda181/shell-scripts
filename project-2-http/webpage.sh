
create_webpage() {
    WEB_DIR="/var/www/html"
    mkdir -p $WEB_DIR

    cat <<EOF > $WEB_DIR/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Welcome Page</title>
</head>
<body style="font-family: Arial; text-align: center; margin-top: 50px;">
    <h1>Welcome to My Modular Web Server</h1>
    <p>This HTML page was deployed using separate script files (DRY concept).</p>
    <hr>
    <p>Deployment successful ✅</p>
</body>
</html>
EOF
}
