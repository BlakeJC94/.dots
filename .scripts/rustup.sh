curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s --  --no-modify-path -y

cargo_bin=${HOME}/.cargo/bin
if ! [[ "$PATH" =~ (^|:)"${cargo_bin}"(:|$) ]]
then
    PATH="${cargo_bin}:$PATH"
fi
