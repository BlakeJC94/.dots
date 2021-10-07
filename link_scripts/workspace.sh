
WORKDIRS=( archived languages scratchpad )
mkdir -p $HOME/Workspace/repos
mkdir -p $HOME/Workspace/data
for DIR in "${WORKDIRS[@]}"; do
    ln -sf $HOME/Dropbox/Home-db/Workspace-db/$DIR $HOME/Workspace/$DIR
done
ln -sf $HOME/Workspace/.sessions $HOME/.sessions
