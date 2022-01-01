# auto-delegation-stargaze-mainnet
These codes, prepared for Stargaze's Mainnet provide automatic delegate of earned rewards.

Instructions are following:

```
git clone https://github.com/umitbeniz/auto-delegation-stargaze-mainnet.git
cd auto-delegation-stargaze-mainnet
chmod +x delegate.sh
```

Set the configuration properties in delegate.sh according to you
```
sudo nano delegate.sh
crontab -e
```

crontab should be the following:
```
0 */3 * * * /delegate.sh
```

This crontab code means that provides to run the delegate.sh for every 3 hours.
You can set it for whatever timing you want.
