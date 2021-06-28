module shumate.MemoryCache;

private import gdk.Texture;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import shumate.Tile;
private import shumate.c.functions;
public  import shumate.c.types;


/**
 * The #ShumateMemoryCache structure contains only private data
 * and should be accessed using the provided API
 */
public class MemoryCache : ObjectG
{
	/** the main Gtk struct */
	protected ShumateMemoryCache* shumateMemoryCache;

	/** Get the main Gtk struct */
	public ShumateMemoryCache* getMemoryCacheStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return shumateMemoryCache;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)shumateMemoryCache;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (ShumateMemoryCache* shumateMemoryCache, bool ownedRef = false)
	{
		this.shumateMemoryCache = shumateMemoryCache;
		super(cast(GObject*)shumateMemoryCache, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return shumate_memory_cache_get_type();
	}

	/**
	 * Constructor of #ShumateMemoryCache.
	 *
	 * Params:
	 *     sizeLimit = maximum number of tiles stored in the cache
	 *
	 * Returns: a constructed #ShumateMemoryCache
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(uint sizeLimit)
	{
		auto __p = shumate_memory_cache_new_full(sizeLimit);

		if(__p is null)
		{
			throw new ConstructionException("null returned by new_full");
		}

		this(cast(ShumateMemoryCache*) __p, true);
	}

	/**
	 * Cleans the contents of the cache.
	 */
	public void clean()
	{
		shumate_memory_cache_clean(shumateMemoryCache);
	}

	/**
	 * Gets the maximum number of tiles stored in the cache.
	 *
	 * Returns: maximum number of stored tiles
	 */
	public uint getSizeLimit()
	{
		return shumate_memory_cache_get_size_limit(shumateMemoryCache);
	}

	/**
	 * Sets the maximum number of tiles stored in the cache.
	 *
	 * Params:
	 *     sizeLimit = maximum number of tiles stored in the cache
	 */
	public void setSizeLimit(uint sizeLimit)
	{
		shumate_memory_cache_set_size_limit(shumateMemoryCache, sizeLimit);
	}

	/** */
	public void storeTexture(Tile tile, Texture texture, string sourceId)
	{
		shumate_memory_cache_store_texture(shumateMemoryCache, (tile is null) ? null : tile.getTileStruct(), (texture is null) ? null : texture.getTextureStruct(), Str.toStringz(sourceId));
	}

	/** */
	public bool tryFillTile(Tile tile, string sourceId)
	{
		return shumate_memory_cache_try_fill_tile(shumateMemoryCache, (tile is null) ? null : tile.getTileStruct(), Str.toStringz(sourceId)) != 0;
	}
}
