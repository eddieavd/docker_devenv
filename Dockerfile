# syntax=docker/dockerfile:1.3-labs
FROM microblinkdev/clang-devenv:13.0.1

ENV 	LC_ALL=en_US.UTF-8                                   \
	TERM=xterm-256color                                  \
	LDFLAGS="-rdynamic"                                  \
	LD_LIBRARY_PATH=/usr/local/lib                       \
	MAKEFLAGS="-j8"                                      \
	PATH=/usr/local/go/bin:/usr/bin/rust/cargo/bin:$PATH \
	RUSTUP_HOME=/usr/bin/rust/rustup                     \
	CARGO_HOME=/usr/bin/rust/cargo

RUN amazon-linux-extras install -y epel

RUN 	<<-EOF
	yum install -y                               \
	automake byacc dbus epel-release             \
	file hostname htop iputils keychain          \
	less libX11-devel libXt-devel libevent-devel \
	ncurses-compat-libs ncurses-devel openssl    \
	pcre-devel perl-IPC-Cmd procps python3-devel \
	usbutils xauth qemu xclip xz-devel yum-utils \
	zlib-devel zsh

	yum clean all

	# install latest stable rust/cargo/whatever
    	curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf \
	        | sh -s -- --default-toolchain stable --profile default --no-modify-path -y
EOF

# google test
RUN	<<-EOF
	set -e
	git clone https://github.com/google/googletest.git /tmp/gtest
	cd /tmp/gtest
	mkdir build && cd build
	cmake ..
	make
	make install
	cd / && rm -rf /tmp/gtest
EOF

# google benchmark
RUN	<<-EOF
	set -e
	git clone https://github.com/google/benchmark.git /tmp/gbench
	cd /tmp/gbench
	cmake -E make_directory "build"
	cmake -E chdir "build" cmake -DBENCHMARK_DOWNLOAD_DEPENDENCIES=on -DCMAKE_BUILD_TYPE=Release ..
	cmake --build "build" --config Release --target install
	cd / && rm -rf /tmp/gbench
EOF

# nodejs npm
RUN	<<-EOF
	set -e
	yum -y update
	mkdir /tmp/node && cd /tmp/node
	curl -sL https://rpm.nodesource.com/setup_16.x | bash -
	yum -y install nodejs
EOF

# vim
RUN 	<<-EOF
	set -e
	git clone --depth=1 https://github.com/vim/vim.git /tmp/vim
	cd /tmp/vim
	./configure --with-features=huge --enable-python3interp=yes --enable-gui=auto \
		    --enable-terminal --with-x
	make && make install
	cd / && rm -rf /tmp/vim
EOF

# vifm
RUN	<<-EOF
	set -e
	git clone --depth=1 https://github.com/vifm/vifm.git /tmp/vifm
	cd /tmp/vifm
	sed -i "s/^am__api_version.*/am__api_version='1.13'/g" configure
	./configure --sysconfdir=/etc
	make && make install
	cd / && rm -rf /tmp/vifm
EOF

# fzf
RUN	<<-EOF
	set -e
	git clone https://github.com/junegunn/fzf.git /tmp/fzf
	cd /tmp/fzf
	make && make install
	cd / && rm -rf /tmp/fzf
EOF

# ag
RUN	<<-EOF
	set -e
	git clone --depth=1 https://github.com/ggreer/the_silver_searcher.git /tmp/ag
	cd /tmp/ag
	./build.sh
	make install
	cd / && rm -rf /tmp/ag
EOF

# tmux
RUN 	<<-EOF
	set -e
	git clone --depth=1 https://github.com/tmux/tmux /tmp/tmux
	cd /tmp/tmux
	sh ./autogen.sh
	./configure
	make && make install
	cd / && rm -rf /tmp/tmux
EOF

# powerline fonts
RUN	<<-EOF
	set -e
	mkdir /tmp/powerline && cd /tmp/powerline
	git clone https://github.com/powerline/fonts .
	./install.sh
	cd / && rm -rf /tmp/powerline
EOF

# tmux themes
RUN	<<-EOF
	set -e
	git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack
EOF

# exa, bat, fd-find
RUN 	<<-EOF
	set -e
	cargo install exa bat fd-find
EOF

CMD /usr/bin/zsh
