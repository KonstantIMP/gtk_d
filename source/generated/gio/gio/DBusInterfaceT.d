module gio.DBusInterfaceT;

public  import gio.DBusInterfaceInfo;
public  import gio.DBusObjectIF;
public  import gio.c.functions;
public  import gio.c.types;
public  import gobject.ObjectG;


/**
 * The #GDBusInterface type is the base type for D-Bus interfaces both
 * on the service side (see #GDBusInterfaceSkeleton) and client side
 * (see #GDBusProxy).
 *
 * Since: 2.30
 */
public template DBusInterfaceT(TStruct)
{
	/** Get the main Gtk struct */
	public GDBusInterface* getDBusInterfaceStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(GDBusInterface*)getStruct();
	}


	/**
	 * Gets the #GDBusObject that @interface_ belongs to, if any.
	 *
	 * Returns: A #GDBusObject or %NULL. The returned
	 *     reference should be freed with g_object_unref().
	 *
	 * Since: 2.32
	 */
	public DBusObjectIF dupObject()
	{
		auto __p = g_dbus_interface_dup_object(getDBusInterfaceStruct());

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(DBusObjectIF)(cast(GDBusObject*) __p, true);
	}

	/**
	 * Gets D-Bus introspection information for the D-Bus interface
	 * implemented by @interface_.
	 *
	 * Returns: A #GDBusInterfaceInfo. Do not free.
	 *
	 * Since: 2.30
	 */
	public DBusInterfaceInfo getInfo()
	{
		auto __p = g_dbus_interface_get_info(getDBusInterfaceStruct());

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(DBusInterfaceInfo)(cast(GDBusInterfaceInfo*) __p);
	}

	/**
	 * Gets the #GDBusObject that @interface_ belongs to, if any.
	 *
	 * It is not safe to use the returned object if @interface_ or
	 * the returned object is being used from other threads. See
	 * g_dbus_interface_dup_object() for a thread-safe alternative.
	 *
	 * Returns: A #GDBusObject or %NULL. The returned
	 *     reference belongs to @interface_ and should not be freed.
	 *
	 * Since: 2.30
	 */
	public DBusObjectIF getObject()
	{
		auto __p = g_dbus_interface_get_object(getDBusInterfaceStruct());

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(DBusObjectIF)(cast(GDBusObject*) __p);
	}

	/**
	 * Sets the #GDBusObject for @interface_ to @object.
	 *
	 * Note that @interface_ will hold a weak reference to @object.
	 *
	 * Params:
	 *     object = A #GDBusObject or %NULL.
	 *
	 * Since: 2.30
	 */
	public void setObject(DBusObjectIF object)
	{
		g_dbus_interface_set_object(getDBusInterfaceStruct(), (object is null) ? null : object.getDBusObjectStruct());
	}
}
