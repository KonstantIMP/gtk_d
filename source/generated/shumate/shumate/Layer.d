module shumate.Layer;

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
 * The #ShumateLayer structure contains only private data
 * and should be accessed using the provided API
 */
public class Layer : Widget
{
	/** the main Gtk struct */
	protected ShumateLayer* shumateLayer;

	/** Get the main Gtk struct */
	public ShumateLayer* getLayerStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return shumateLayer;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)shumateLayer;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (ShumateLayer* shumateLayer, bool ownedRef = false)
	{
		this.shumateLayer = shumateLayer;
		super(cast(GtkWidget*)shumateLayer, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return shumate_layer_get_type();
	}

	/**
	 * Gets the #ShumateViewport used by this layer.
	 *
	 * Returns: The #ShumateViewport.
	 */
	public Viewport getViewport()
	{
		auto __p = shumate_layer_get_viewport(shumateLayer);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Viewport)(cast(ShumateViewport*) __p);
	}
}
