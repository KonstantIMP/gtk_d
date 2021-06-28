module shumate.FileCache;

private import gio.AsyncResultIF;
private import gio.Cancellable;
private import glib.Bytes;
private import glib.ConstructionException;
private import glib.DateTime;
private import glib.ErrorG;
private import glib.GException;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import shumate.Tile;
private import shumate.c.functions;
public  import shumate.c.types;


/**
 * The #ShumateFileCache structure contains only private data
 * and should be accessed using the provided API
 */
public class FileCache : ObjectG
{
	/** the main Gtk struct */
	protected ShumateFileCache* shumateFileCache;

	/** Get the main Gtk struct */
	public ShumateFileCache* getFileCacheStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return shumateFileCache;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)shumateFileCache;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (ShumateFileCache* shumateFileCache, bool ownedRef = false)
	{
		this.shumateFileCache = shumateFileCache;
		super(cast(GObject*)shumateFileCache, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return shumate_file_cache_get_type();
	}

	/**
	 * Constructor of #ShumateFileCache.
	 *
	 * Params:
	 *     sizeLimit = maximum size of the cache in bytes
	 *     cacheKey = an ID for the tileset to store/retrieve
	 *     cacheDir = the directory where the cache is created. When cache_dir == NULL,
	 *         a cache in ~/.cache/shumate is used.
	 *
	 * Returns: a constructed #ShumateFileCache
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(uint sizeLimit, string cacheKey, string cacheDir)
	{
		auto __p = shumate_file_cache_new_full(sizeLimit, Str.toStringz(cacheKey), Str.toStringz(cacheDir));

		if(__p is null)
		{
			throw new ConstructionException("null returned by new_full");
		}

		this(cast(ShumateFileCache*) __p, true);
	}

	/**
	 * Gets the directory where the cache database is stored.
	 *
	 * Returns: the directory
	 */
	public string getCacheDir()
	{
		return Str.toString(shumate_file_cache_get_cache_dir(shumateFileCache));
	}

	/**
	 * Gets the key used to store and retrieve tiles from the cache. Different keys
	 * can be used to store multiple tilesets in the same cache directory.
	 *
	 * Returns: the cache key
	 */
	public string getCacheKey()
	{
		return Str.toString(shumate_file_cache_get_cache_key(shumateFileCache));
	}

	/**
	 * Gets the cache size limit in bytes.
	 *
	 * Returns: size limit
	 */
	public uint getSizeLimit()
	{
		return shumate_file_cache_get_size_limit(shumateFileCache);
	}

	/**
	 * Gets tile data from the cache, if it is available.
	 *
	 * Params:
	 *     tile = a #ShumateTile
	 *     cancellable = a #GCancellable
	 *     callback = a #GAsyncReadyCallback to execute upon completion
	 *     userData = closure data for @callback
	 */
	public void getTileAsync(Tile tile, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		shumate_file_cache_get_tile_async(shumateFileCache, (tile is null) ? null : tile.getTileStruct(), (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/**
	 * Gets the tile data from a completed shumate_file_cache_get_tile_async()
	 * operation.
	 *
	 * @modtime will be set to the time the tile was added to the cache, or the
	 * latest time it was confirmed to be up to date.
	 *
	 * @etag will be set to the data's ETag, if present.
	 *
	 * Params:
	 *     etag = a location for the data's ETag, or %NULL
	 *     modtime = a location to return the tile's last modification time, or %NULL
	 *     result = a #GAsyncResult provided to callback
	 *
	 * Returns: a #GBytes containing the tile data, or %NULL if the tile was not in
	 *     the cache or an error occurred
	 *
	 * Throws: GException on failure.
	 */
	public Bytes getTileFinish(out string etag, out DateTime modtime, AsyncResultIF result)
	{
		char* outetag = null;
		GDateTime* outmodtime = null;
		GError* err = null;

		auto __p = shumate_file_cache_get_tile_finish(shumateFileCache, &outetag, &outmodtime, (result is null) ? null : result.getAsyncResultStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		etag = Str.toString(outetag);
		modtime = new DateTime(outmodtime);

		if(__p is null)
		{
			return null;
		}

		return new Bytes(cast(GBytes*) __p, true);
	}

	/**
	 * Marks a tile in the cache as being up to date, without changing its data.
	 *
	 * For example, a network source might call this function when it gets an HTTP
	 * 304 Not Modified response.
	 *
	 * Params:
	 *     tile = a #ShumateTile
	 */
	public void markUpToDate(Tile tile)
	{
		shumate_file_cache_mark_up_to_date(shumateFileCache, (tile is null) ? null : tile.getTileStruct());
	}

	/**
	 * Removes less used tiles from the cache, if necessary, until it fits in
	 * the size limit.
	 *
	 * Params:
	 *     cancellable = a #GCancellable
	 *     callback = a #GAsyncReadyCallback to execute upon completion
	 *     userData = closure data for @callback
	 */
	public void purgeCacheAsync(Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		shumate_file_cache_purge_cache_async(shumateFileCache, (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/**
	 * Gets the result of an async operation started using
	 * shumate_file_cache_purge_cache_async().
	 *
	 * Params:
	 *     result = a #GAsyncResult provided to callback
	 *
	 * Returns: %TRUE if any tiles were removed, otherwise %FALSE
	 *
	 * Throws: GException on failure.
	 */
	public bool purgeCacheFinish(AsyncResultIF result)
	{
		GError* err = null;

		auto __p = shumate_file_cache_purge_cache_finish(shumateFileCache, (result is null) ? null : result.getAsyncResultStruct(), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return __p;
	}

	/**
	 * Sets the cache size limit in bytes.
	 *
	 * Params:
	 *     sizeLimit = the cache limit in bytes
	 */
	public void setSizeLimit(uint sizeLimit)
	{
		shumate_file_cache_set_size_limit(shumateFileCache, sizeLimit);
	}

	/**
	 * Stores a tile in the cache.
	 *
	 * Params:
	 *     tile = a #ShumateTile
	 *     bytes = a #GBytes
	 *     etag = an ETag string, or %NULL
	 *     cancellable = a #GCancellable
	 *     callback = a #GAsyncReadyCallback to execute upon completion
	 *     userData = closure data for @callback
	 */
	public void storeTileAsync(Tile tile, Bytes bytes, string etag, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		shumate_file_cache_store_tile_async(shumateFileCache, (tile is null) ? null : tile.getTileStruct(), (bytes is null) ? null : bytes.getBytesStruct(), Str.toStringz(etag), (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/**
	 * Gets the success value of a completed shumate_file_cache_store_tile_async()
	 * operation.
	 *
	 * Params:
	 *     result = a #GAsyncResult provided to callback
	 *
	 * Returns: %TRUE if the operation was successful, otherwise %FALSE
	 *
	 * Throws: GException on failure.
	 */
	public bool storeTileFinish(AsyncResultIF result)
	{
		GError* err = null;

		auto __p = shumate_file_cache_store_tile_finish(shumateFileCache, (result is null) ? null : result.getAsyncResultStruct(), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return __p;
	}
}
