module shumate.MapLayer;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import shumate.Layer;
private import shumate.MapSource;
private import shumate.Viewport;
private import shumate.c.functions;
public  import shumate.c.types;


/** */
public class MapLayer : Layer
{
	/** the main Gtk struct */
	protected ShumateMapLayer* shumateMapLayer;

	/** Get the main Gtk struct */
	public ShumateMapLayer* getMapLayerStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return shumateMapLayer;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)shumateMapLayer;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (ShumateMapLayer* shumateMapLayer, bool ownedRef = false)
	{
		this.shumateMapLayer = shumateMapLayer;
		super(cast(ShumateLayer*)shumateMapLayer, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return shumate_map_layer_get_type();
	}

	/** */
	public this(MapSource mapSource, Viewport viewport)
	{
		auto __p = shumate_map_layer_new((mapSource is null) ? null : mapSource.getMapSourceStruct(), (viewport is null) ? null : viewport.getViewportStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(ShumateMapLayer*) __p);
	}
}
