module gobject.TypeInstance;

private import gobject.c.functions;
public  import gobject.c.types;


/**
 * An opaque structure used as the base of all type instances.
 */
public class TypeInstance
{
	/** the main Gtk struct */
	protected GTypeInstance* gTypeInstance;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GTypeInstance* getTypeInstanceStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gTypeInstance;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gTypeInstance;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GTypeInstance* gTypeInstance, bool ownedRef = false)
	{
		this.gTypeInstance = gTypeInstance;
		this.ownedRef = ownedRef;
	}


	/** */
	public void* getPrivate(GType privateType)
	{
		return g_type_instance_get_private(gTypeInstance, privateType);
	}
}
