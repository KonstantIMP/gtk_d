module gio.DBusObjectIF;

private import gio.DBusInterfaceIF;
private import gio.c.functions;
public  import gio.c.types;
private import glib.ListG;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import gobject.Signals;
private import std.algorithm;


/**
 * The #GDBusObject type is the base type for D-Bus objects on both
 * the service side (see #GDBusObjectSkeleton) and the client side
 * (see #GDBusObjectProxy). It is essentially just a container of
 * interfaces.
 */
public interface DBusObjectIF{
	/** Get the main Gtk struct */
	public GDBusObject* getDBusObjectStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return g_dbus_object_get_type();
	}

	/**
	 * Gets the D-Bus interface with name @interface_name associated with
	 * @object, if any.
	 *
	 * Params:
	 *     interfaceName = A D-Bus interface name.
	 *
	 * Returns: %NULL if not found, otherwise a
	 *     #GDBusInterface that must be freed with g_object_unref().
	 *
	 * Since: 2.30
	 */
	public DBusInterfaceIF getInterface(string interfaceName);

	/**
	 * Gets the D-Bus interfaces associated with @object.
	 *
	 * Returns: A list of #GDBusInterface instances.
	 *     The returned list must be freed by g_list_free() after each element has been freed
	 *     with g_object_unref().
	 *
	 * Since: 2.30
	 */
	public ListG getInterfaces();

	/**
	 * Gets the object path for @object.
	 *
	 * Returns: A string owned by @object. Do not free.
	 *
	 * Since: 2.30
	 */
	public string getObjectPath();

	/**
	 * Emitted when @interface is added to @object.
	 *
	 * Params:
	 *     interface_ = The #GDBusInterface that was added.
	 *
	 * Since: 2.30
	 */
	gulong addOnInterfaceAdded(void delegate(DBusInterfaceIF, DBusObjectIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0);

	/**
	 * Emitted when @interface is removed from @object.
	 *
	 * Params:
	 *     interface_ = The #GDBusInterface that was removed.
	 *
	 * Since: 2.30
	 */
	gulong addOnInterfaceRemoved(void delegate(DBusInterfaceIF, DBusObjectIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0);
}
