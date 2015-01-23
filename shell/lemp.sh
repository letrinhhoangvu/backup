

sudo yum install php-devel pcre-devel gcc make -y
sudo yum install libtool re2c -y
git clone https://github.com/json-c/json-c.git
cd json-c

sh autogen.sh
./configure
make && sudo make install

cd .. && git clone https://github.com/phalcon/zephir
cd zephir
./install -c

cd ..
git clone http://github.com/phalcon/cphalcon
cd cphalcon
git checkout 2.0.0
zephir build
