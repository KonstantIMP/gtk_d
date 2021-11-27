module gio.ZlibCompressor;

private import gio.ConverterIF;
private import gio.ConverterT;
private import gio.FileInfo;
private import gio.c.functions;
public  import gio.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/**
 * #GZlibCompressor is an implementation of #GConverter that
 * compresses data using zlib.
 */
public class ZlibCompressor : ObjectG, ConverterIF
{
	/** the main Gtk struct */
	protected GZlibCompressor* gZlibCompressor;

	/** Get the main Gtk struct */
	public GZlibCompressor* getZlibCompressorStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gZlibCompressor;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gZlibCompressor;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GZlibCompressor* gZlibCompressor, bool ownedRef = false)
	{
		this.gZlibCompressor = gZlibCompressor;
		super(cast(GObject*)gZlibCompressor, ownedRef);
	}

	// add the Converter capabilities
	mixin ConverterT!(GZlibCompressor);


	/** */
	public static GType getType()
	{
		return g_zlib_compressor_get_type();
	}

	/**
	 * Creates a new #GZlibCompressor.
	 *
	 * Params:
	 *     format = The format to use for the compressed data
	 *     level = compression level (0-9), -1 for default
	 *
	 * Returns: a new #GZlibCompressor
	 *
	 * Since: 2.24
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(GZlibCompressorFormat format, int level)
	{
		auto __p = g_zlib_compressor_new(format, level);

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GZlibCompressor*) __p, true);
	}

	/**
	 * Returns the #GZlibCompressor:file-info property.
	 *
	 * Returns: a #GFileInfo, or %NULL
	 *
	 * Since: 2.26
	 */
	public FileInfo getFileInfo()
	{
		auto __p = g_zlib_compressor_get_file_info(gZlibCompressor);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(FileInfo)(cast(GFileInfo*) __p);
	}

	/**
	 * Sets @file_info in @compressor. If non-%NULL, and @compressor's
	 * #GZlibCompressor:format property is %G_ZLIB_COMPRESSOR_FORMAT_GZIP,
	 * it will be used to set the file name and modification time in
	 * the GZIP header of the compressed data.
	 *
	 * Note: it is an error to call this function while a compression is in
	 * progress; it may only be called immediately after creation of @compressor,
	 * or after resetting it with g_converter_reset().
	 *
	 * Params:
	 *     fileInfo = a #GFileInfo
	 *
	 * Since: 2.26
	 */
	public void setFileInfo(FileInfo fileInfo)
	{
		g_zlib_compressor_set_file_info(gZlibCompressor, (fileInfo is null) ? null : fileInfo.getFileInfoStruct());
	}
}
