string cronexp = '0 0 13 * * ?';

system.schedule('account schedule anon', cronExp, new AccountSchedulable());