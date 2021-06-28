module gio.Emblem;

private import gio.IconIF;
private import gio.IconT;
private import gio.c.functions;
public  import gio.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/**
 * #GEmblem is an implementation of #GIcon that supports
 * having an emblem, which is an icon with additional properties.
 * It can than be added to a #GEmblemedIcon.
 * 
 * Currently, only metainformation about the emblem's origin is
 * supported. More may be added in the future.
 */
public class Emblem : ObjectG, IconIF
{
	/** the main Gtk struct */
	protected GEmblem* gEmblem;

	/** Get the main Gtk struct */
	public GEmblem* getEmblemStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gEmblem;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gEmblem;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GEmblem* gEmblem, bool ownedRef = false)
	{
		this.gEmblem = gEmblem;
		super(cast(GObject*)gEmblem, ownedRef);
	}

	// add the Icon capabilities
	mixin IconT!(GEmblem);


	/** */
	public static GType getType()
	{
		return g_emblem_get_type();
	}

	/**
	 * Creates a new emblem for @icon.
	 *
	 * Params:
	 *     icon = a GIcon containing the icon.
	 *
	 * Returns: a new #GEmblem.
	 *
	 * Since: 2.18
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(IconIF icon)
	{
		auto __p = g_emblem_new((icon is null) ? null : icon.getIconStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GEmblem*) __p, true);
	}

	/**
	 * Creates a new emblem for @icon.
	 *
	 * Params:
	 *     icon = a GIcon containing the icon.
	 *     origin = a GEmblemOrigin enum defining the emblem's origin
	 *
	 * Returns: a new #GEmblem.
	 *
	 * Since: 2.18
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(IconIF icon, GEmblemOrigin origin)
	{
		auto __p = g_emblem_new_with_origin((icon is null) ? null : icon.getIconStruct(), origin);

		if(__p is null)
		{
			throw new ConstructionException("null returned by new_with_origin");
		}

		this(cast(GEmblem*) __p, true);
	}

	/**
	 * Gives back the icon from @emblem.
	 *
	 * Returns: a #GIcon. The returned object belongs to
	 *     the emblem and should not be modified or freed.
	 *
	 * Since: 2.18
	 */
	public IconIF getIcon()
	{
		auto __p = g_emblem_get_icon(gEmblem);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(IconIF)(cast(GIcon*) __p);
	}

	/**
	 * Gets the origin of the emblem.
	 *
	 * Returns: the origin of the emblem
	 *
	 * Since: 2.18
	 */
	public GEmblemOrigin getOrigin()
	{
		return g_emblem_get_origin(gEmblem);
	}
}
