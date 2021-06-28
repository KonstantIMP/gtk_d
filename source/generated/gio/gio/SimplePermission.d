module gio.SimplePermission;

private import gio.Permission;
private import gio.c.functions;
public  import gio.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/**
 * #GSimplePermission is a trivial implementation of #GPermission that
 * represents a permission that is either always or never allowed.  The
 * value is given at construction and doesn't change.
 * 
 * Calling request or release will result in errors.
 */
public class SimplePermission : Permission
{
	/** the main Gtk struct */
	protected GSimplePermission* gSimplePermission;

	/** Get the main Gtk struct */
	public GSimplePermission* getSimplePermissionStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gSimplePermission;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gSimplePermission;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GSimplePermission* gSimplePermission, bool ownedRef = false)
	{
		this.gSimplePermission = gSimplePermission;
		super(cast(GPermission*)gSimplePermission, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return g_simple_permission_get_type();
	}

	/**
	 * Creates a new #GPermission instance that represents an action that is
	 * either always or never allowed.
	 *
	 * Params:
	 *     allowed = %TRUE if the action is allowed
	 *
	 * Returns: the #GSimplePermission, as a #GPermission
	 *
	 * Since: 2.26
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(bool allowed)
	{
		auto __p = g_simple_permission_new(allowed);

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GSimplePermission*) __p, true);
	}
}
