: ${lbu:=/opt/LiveBootUtils}
. "$lbu/scripts/common.func"

test -n "${SILENT_EXIT+set}" || SILENT_EXIT=1

case ":$PATH:" in
  *:$HOME/.local/bin:*) ;;
  *) export PATH="$HOME/.local/bin:$PATH" ;;
esac

pip_inst() {
  CPPFLAGS="-I/opt/include" LDFLAGS="-Wl,-rpath=/opt/lib -L/opt/lib" pip install \
    --upgrade --install-option="--prefix=/opt" --root "$DESTDIR" \
    ${pip_switches} \
    "$@"
}
