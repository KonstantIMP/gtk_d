module shumate.Layer;

private import glib.Str;
private import glib.c.functions;
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
 * Every layer (overlay that moves together with the map) has to inherit this
 * class and implement its virtual methods.
 * 
 * You can use the same layer to display many types of maps.  In Shumate they
 * are called map sources.  You can change the [property@MapLayer:map-source]
 * property at any time to replace the current displayed map.
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
	 * Gets the license text to show on the map for this layer.
	 *
	 * Returns: the license text
	 */
	public string getLicense()
	{
		return Str.toString(shumate_layer_get_license(shumateLayer));
	}

	/**
	 * Gets a link to view more information about the layer's license, if available.
	 *
	 * Returns: a URI
	 */
	public string getLicenseUri()
	{
		return Str.toString(shumate_layer_get_license_uri(shumateLayer));
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
