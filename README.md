# HAProxy-LetsEncrypt-MultiDomainSetup
This describes my way of configuring LetsEncrypt in combination with a multi-domain setup


## Initial Setup
The team at [ServersforHackers](https://serversforhackers.com/c/letsencrypt-with-haproxy) did a great deal with describing a really nice method for setting up a HAProxy setup which handles a LetsEncrypt Certbot passtrough in order to deal with certificate request and renewal.

However, in my setup i did not wanted to have one certificate for all the websites i was hosting. Therefor i created a way to handle multiple domain certificates, and have HAProxy lookup a directory instead of a single certificate file. This option was already present at HAProxy, but nowadays in combination with LetsEncrypt it needed a little help.

### The scripts in this repo
After installing the setup like the ServersforHackers, you are met with a working setup. However you can now choose to extend the functionality. This can be done by using the install-certs.sh and update-certs.sh i have attached.

` cp install-certs.sh /opt/ && cp update-certs.sh /opt/
chmod +x /opt/install-certs.sh && chmod +x /opt/update-certs.sh`

## How to start
Initially when requesting your first couple of certificates, you should utilize Certbot (or LetsEncrypt for all that matters) to retrieve new certificates. This is the command to use for that;

`certbot certonly --standalone -d www.domain.com -d domain.com --non-interactive --http-01-port=8888 --agree-tos --email emailaddress@domain.com`

This will result in a certificate beeing places in the /etc/letsencrypt/ folder structure. 

### Converting and installing the LetsEncrypt certificates
After the retrieval of a new certificate, you should run the install script that was added to this repo.

`/opt/install-certs.sh

root@server:/# /opt/install-certs.sh

Now fixing domain.com
Now fixing domain1.com
Now fixing domain2.com
Now fixing domain3.com
`

And thats it! You're done. From now on, all certificates will be renewed and automaticly be converted to HAProxy-compatible certificates.
