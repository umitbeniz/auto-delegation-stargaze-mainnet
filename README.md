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
0 */1 * * * /delegate.sh
```

This crontab code means that provides to run the delegate.sh for every 1 hour.
You can set it for whatever timing you want.

An example output should be:
![image](https://user-images.githubusercontent.com/59064310/147858200-5a7134d6-8460-4767-9b1d-e43655e68e17.png)


An example of crontab screen should be:
![image](https://user-images.githubusercontent.com/59064310/147858332-a580fe5c-7edf-4089-8c86-3832c9909297.png)

