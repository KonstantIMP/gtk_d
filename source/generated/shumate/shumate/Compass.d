module shumate.Compass;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.AccessibleIF;
private import gtk.AccessibleT;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.ConstraintTargetIF;
private import gtk.ConstraintTargetT;
private import gtk.Widget;
private import shumate.Viewport;
private import shumate.c.functions;
public  import shumate.c.types;


/**
 * A widget displaying a compass.
 * 
 * # CSS nodes
 * 
 * ```
 * map-compass
 * ├── revealer
 * ├──── image
 * ```
 * 
 * `ShumateCompass` uses a single CSS node with name map-compass. It also uses an
 * image named "map-compass".
 */
public class Compass : Widget
{
	/** the main Gtk struct */
	protected ShumateCompass* shumateCompass;

	/** Get the main Gtk struct */
	public ShumateCompass* getCompassStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return shumateCompass;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)shumateCompass;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (ShumateCompass* shumateCompass, bool ownedRef = false)
	{
		this.shumateCompass = shumateCompass;
		super(cast(GtkWidget*)shumateCompass, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return shumate_compass_get_type();
	}

	/**
	 * Creates an instance of #ShumateCompass.
	 *
	 * Params:
	 *     viewport = a #ShumateViewport
	 *
	 * Returns: a new #ShumateCompass.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Viewport viewport)
	{
		auto __p = shumate_compass_new((viewport is null) ? null : viewport.getViewportStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(ShumateCompass*) __p);
	}

	/**
	 * Gets the viewport used by the compass.
	 *
	 * Returns: The #ShumateViewport used by the compass
	 */
	public Viewport getViewport()
	{
		auto __p = shumate_compass_get_viewport(shumateCompass);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Viewport)(cast(ShumateViewport*) __p);
	}

	/**
	 * Sets the compass viewport.
	 *
	 * Params:
	 *     viewport = a #ShumateViewport
	 */
	public void setViewport(Viewport viewport)
	{
		shumate_compass_set_viewport(shumateCompass, (viewport is null) ? null : viewport.getViewportStruct());
	}
}
