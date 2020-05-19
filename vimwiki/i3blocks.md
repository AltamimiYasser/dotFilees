
1. every block start with `[blockname]`
2. we have to have a text or a command and an interval for it to run
3. we can use signals to update our blocks:
    ```
    [volume]
    command=/path/to/script/
    interval=once
    signal=5
    ```
    and then we write a script `~/scripts/volume_signal`:
    ```
    pkill -SIGRTMIN+5 i3blocks
    ```
    and when we bind the volume key in our `config` file for i3 we call this script and it will signal the script to update

4. we can also [create a script](create a script).
