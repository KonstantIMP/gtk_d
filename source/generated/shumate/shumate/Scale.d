module shumate.Scale;

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
 * A widget displaying a scale.
 * 
 * # CSS nodes
 * 
 * ```
 * map-scale
 * ├── label[.metric][.imperial]
 * ```
 * 
 * `ShumateScale` uses a single CSS node with name map-scale, it has up to two
 * childs different labels.
 */
public class Scale : Widget
{
	/** the main Gtk struct */
	protected ShumateScale* shumateScale;

	/** Get the main Gtk struct */
	public ShumateScale* getScaleStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return shumateScale;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)shumateScale;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (ShumateScale* shumateScale, bool ownedRef = false)
	{
		this.shumateScale = shumateScale;
		super(cast(GtkWidget*)shumateScale, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return shumate_scale_get_type();
	}

	/**
	 * Creates an instance of #ShumateScale.
	 *
	 * Params:
	 *     viewport = a #ShumateViewport
	 *
	 * Returns: a new #ShumateScale.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Viewport viewport)
	{
		auto __p = shumate_scale_new((viewport is null) ? null : viewport.getViewportStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(ShumateScale*) __p);
	}

	/**
	 * Gets the maximum scale width.
	 *
	 * Returns: The maximum scale width in pixels.
	 */
	public uint getMaxWidth()
	{
		return shumate_scale_get_max_width(shumateScale);
	}

	/**
	 * Gets the unit used by the scale.
	 *
	 * Returns: The unit used by the scale
	 */
	public ShumateUnit getUnit()
	{
		return shumate_scale_get_unit(shumateScale);
	}

	/**
	 * Gets the viewport used by the scale.
	 *
	 * Returns: The #ShumateViewport used by the scale
	 */
	public Viewport getViewport()
	{
		auto __p = shumate_scale_get_viewport(shumateScale);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Viewport)(cast(ShumateViewport*) __p);
	}

	/**
	 * Sets the maximum width of the scale on the screen in pixels
	 *
	 * Params:
	 *     value = the number of pixels
	 */
	public void setMaxWidth(uint value)
	{
		shumate_scale_set_max_width(shumateScale, value);
	}

	/**
	 * Sets the scale unit.
	 *
	 * Params:
	 *     unit = a #ShumateUnit
	 */
	public void setUnit(ShumateUnit unit)
	{
		shumate_scale_set_unit(shumateScale, unit);
	}

	/**
	 * Sets the scale viewport.
	 *
	 * Params:
	 *     viewport = a #ShumateViewport
	 */
	public void setViewport(Viewport viewport)
	{
		shumate_scale_set_viewport(shumateScale, (viewport is null) ? null : viewport.getViewportStruct());
	}
}
