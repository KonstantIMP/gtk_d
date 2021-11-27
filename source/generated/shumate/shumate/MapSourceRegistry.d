module shumate.MapSourceRegistry;

private import gio.ListModelIF;
private import gio.ListModelT;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import shumate.MapSource;
private import shumate.c.functions;
public  import shumate.c.types;


/**
 * This object allows you to hold [class@MapSource] instances, you can access a
 * default set of sources with [method@MapSourceRegistry.populate_defaults].
 * 
 * It conveniently implements [iface@Gio.ListModel] to easily integrate with it.
 */
public class MapSourceRegistry : ObjectG, ListModelIF
{
	/** the main Gtk struct */
	protected ShumateMapSourceRegistry* shumateMapSourceRegistry;

	/** Get the main Gtk struct */
	public ShumateMapSourceRegistry* getMapSourceRegistryStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return shumateMapSourceRegistry;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)shumateMapSourceRegistry;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (ShumateMapSourceRegistry* shumateMapSourceRegistry, bool ownedRef = false)
	{
		this.shumateMapSourceRegistry = shumateMapSourceRegistry;
		super(cast(GObject*)shumateMapSourceRegistry, ownedRef);
	}

	// add the ListModel capabilities
	mixin ListModelT!(ShumateMapSourceRegistry);

	/**
	 * Create a new #ShumateMapSourceRegistry.
	 *
	 * Returns: a newly created #ShumateMapSourceRegistry
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(bool defaults = false)
	{
		ShumateMapSourceRegistry* __p;

		if (!defaults) __p = shumate_map_source_registry_new();
		else __p = shumate_map_source_registry_new_with_defaults();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(ShumateMapSourceRegistry*) __p, true);
	}

	/**
	 */

	/** */
	public static GType getType()
	{
		return shumate_map_source_registry_get_type();
	}

	/**
	 * Adds the #ShumateMapSource to the #ShumateMapSourceRegistry
	 *
	 * Params:
	 *     mapSource = a #ShumateMapSource
	 */
	public void add(MapSource mapSource)
	{
		shumate_map_source_registry_add(shumateMapSourceRegistry, (mapSource is null) ? null : mapSource.getMapSourceStruct());
	}

	/**
	 * Find the #ShumateMapSource with the corresponding id
	 *
	 * Params:
	 *     id = the id of the #ShumateMapSource
	 *
	 * Returns: the #ShumateMapSource or %NULL if no
	 *     map source has been found
	 */
	public MapSource getById(string id)
	{
		auto __p = shumate_map_source_registry_get_by_id(shumateMapSourceRegistry, Str.toStringz(id));

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(MapSource)(cast(ShumateMapSource*) __p);
	}

	/**
	 * Populates the #ShumateMapSourceRegistry with a default set of sources.
	 */
	public void populateDefaults()
	{
		shumate_map_source_registry_populate_defaults(shumateMapSourceRegistry);
	}

	/**
	 * Removes the corresponding #ShumateMapSource from the registry.
	 * If the source doesn't exist in the registry, this function does nothing.
	 *
	 * Params:
	 *     id = a #ShumateMapSource id
	 */
	public void remove(string id)
	{
		shumate_map_source_registry_remove(shumateMapSourceRegistry, Str.toStringz(id));
	}
}
