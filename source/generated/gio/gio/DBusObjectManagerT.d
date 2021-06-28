module gio.DBusObjectManagerT;

public  import gio.DBusInterfaceIF;
public  import gio.DBusObjectIF;
public  import gio.c.functions;
public  import gio.c.types;
public  import glib.ListG;
public  import glib.Str;
public  import glib.c.functions;
public  import gobject.ObjectG;
public  import gobject.Signals;
public  import std.algorithm;


/**
 * The #GDBusObjectManager type is the base type for service- and
 * client-side implementations of the standardized
 * [org.freedesktop.DBus.ObjectManager](http://dbus.freedesktop.org/doc/dbus-specification.html#standard-interfaces-objectmanager)
 * interface.
 * 
 * See #GDBusObjectManagerClient for the client-side implementation
 * and #GDBusObjectManagerServer for the service-side implementation.
 */
public template DBusObjectManagerT(TStruct)
{
	/** Get the main Gtk struct */
	public GDBusObjectManager* getDBusObjectManagerStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(GDBusObjectManager*)getStruct();
	}


	/**
	 * Gets the interface proxy for @interface_name at @object_path, if
	 * any.
	 *
	 * Params:
	 *     objectPath = Object path to look up.
	 *     interfaceName = D-Bus interface name to look up.
	 *
	 * Returns: A #GDBusInterface instance or %NULL. Free
	 *     with g_object_unref().
	 *
	 * Since: 2.30
	 */
	public DBusInterfaceIF getInterface(string objectPath, string interfaceName)
	{
		auto __p = g_dbus_object_manager_get_interface(getDBusObjectManagerStruct(), Str.toStringz(objectPath), Str.toStringz(interfaceName));

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(DBusInterfaceIF)(cast(GDBusInterface*) __p, true);
	}

	/**
	 * Gets the #GDBusObjectProxy at @object_path, if any.
	 *
	 * Params:
	 *     objectPath = Object path to look up.
	 *
	 * Returns: A #GDBusObject or %NULL. Free with
	 *     g_object_unref().
	 *
	 * Since: 2.30
	 */
	public DBusObjectIF getObject(string objectPath)
	{
		auto __p = g_dbus_object_manager_get_object(getDBusObjectManagerStruct(), Str.toStringz(objectPath));

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(DBusObjectIF)(cast(GDBusObject*) __p, true);
	}

	/**
	 * Gets the object path that @manager is for.
	 *
	 * Returns: A string owned by @manager. Do not free.
	 *
	 * Since: 2.30
	 */
	public string getObjectPath()
	{
		return Str.toString(g_dbus_object_manager_get_object_path(getDBusObjectManagerStruct()));
	}

	/**
	 * Gets all #GDBusObject objects known to @manager.
	 *
	 * Returns: A list of
	 *     #GDBusObject objects. The returned list should be freed with
	 *     g_list_free() after each element has been freed with
	 *     g_object_unref().
	 *
	 * Since: 2.30
	 */
	public ListG getObjects()
	{
		auto __p = g_dbus_object_manager_get_objects(getDBusObjectManagerStruct());

		if(__p is null)
		{
			return null;
		}

		return new ListG(cast(GList*) __p, true);
	}

	/**
	 * Emitted when @interface is added to @object.
	 *
	 * This signal exists purely as a convenience to avoid having to
	 * connect signals to all objects managed by @manager.
	 *
	 * Params:
	 *     object = The #GDBusObject on which an interface was added.
	 *     interface_ = The #GDBusInterface that was added.
	 *
	 * Since: 2.30
	 */
	gulong addOnInterfaceAdded(void delegate(DBusObjectIF, DBusInterfaceIF, DBusObjectManagerIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "interface-added", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted when @interface has been removed from @object.
	 *
	 * This signal exists purely as a convenience to avoid having to
	 * connect signals to all objects managed by @manager.
	 *
	 * Params:
	 *     object = The #GDBusObject on which an interface was removed.
	 *     interface_ = The #GDBusInterface that was removed.
	 *
	 * Since: 2.30
	 */
	gulong addOnInterfaceRemoved(void delegate(DBusObjectIF, DBusInterfaceIF, DBusObjectManagerIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "interface-removed", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted when @object is added to @manager.
	 *
	 * Params:
	 *     object = The #GDBusObject that was added.
	 *
	 * Since: 2.30
	 */
	gulong addOnObjectAdded(void delegate(DBusObjectIF, DBusObjectManagerIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "object-added", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted when @object is removed from @manager.
	 *
	 * Params:
	 *     object = The #GDBusObject that was removed.
	 *
	 * Since: 2.30
	 */
	gulong addOnObjectRemoved(void delegate(DBusObjectIF, DBusObjectManagerIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "object-removed", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
