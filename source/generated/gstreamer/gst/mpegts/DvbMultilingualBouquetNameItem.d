module gst.mpegts.DvbMultilingualBouquetNameItem;

private import glib.MemorySlice;
private import glib.Str;
private import glib.c.functions;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/**
 * a multilingual bouquet name entry
 */
public final class DvbMultilingualBouquetNameItem
{
	/** the main Gtk struct */
	protected GstMpegtsDvbMultilingualBouquetNameItem* gstMpegtsDvbMultilingualBouquetNameItem;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsDvbMultilingualBouquetNameItem* getDvbMultilingualBouquetNameItemStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsDvbMultilingualBouquetNameItem;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsDvbMultilingualBouquetNameItem;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsDvbMultilingualBouquetNameItem* gstMpegtsDvbMultilingualBouquetNameItem, bool ownedRef = false)
	{
		this.gstMpegtsDvbMultilingualBouquetNameItem = gstMpegtsDvbMultilingualBouquetNameItem;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsDvbMultilingualBouquetNameItem);
	}


	/**
	 * the ISO 639 language code
	 */
	public @property string languageCode()
	{
		return Str.toString(gstMpegtsDvbMultilingualBouquetNameItem.languageCode);
	}

	/** Ditto */
	public @property void languageCode(string value)
	{
		gstMpegtsDvbMultilingualBouquetNameItem.languageCode = Str.toStringz(value);
	}

	/**
	 * the bouquet name
	 */
	public @property string bouquetName()
	{
		return Str.toString(gstMpegtsDvbMultilingualBouquetNameItem.bouquetName);
	}

	/** Ditto */
	public @property void bouquetName(string value)
	{
		gstMpegtsDvbMultilingualBouquetNameItem.bouquetName = Str.toStringz(value);
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_dvb_multilingual_bouquet_name_item_get_type();
	}
}
