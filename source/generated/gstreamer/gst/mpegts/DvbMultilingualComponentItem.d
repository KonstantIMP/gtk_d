module gst.mpegts.DvbMultilingualComponentItem;

private import glib.MemorySlice;
private import glib.Str;
private import glib.c.functions;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/** */
public final class DvbMultilingualComponentItem
{
	/** the main Gtk struct */
	protected GstMpegtsDvbMultilingualComponentItem* gstMpegtsDvbMultilingualComponentItem;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsDvbMultilingualComponentItem* getDvbMultilingualComponentItemStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsDvbMultilingualComponentItem;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsDvbMultilingualComponentItem;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsDvbMultilingualComponentItem* gstMpegtsDvbMultilingualComponentItem, bool ownedRef = false)
	{
		this.gstMpegtsDvbMultilingualComponentItem = gstMpegtsDvbMultilingualComponentItem;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsDvbMultilingualComponentItem);
	}


	/**
	 * the ISO 639 language code
	 */
	public @property string languageCode()
	{
		return Str.toString(gstMpegtsDvbMultilingualComponentItem.languageCode);
	}

	/** Ditto */
	public @property void languageCode(string value)
	{
		gstMpegtsDvbMultilingualComponentItem.languageCode = Str.toStringz(value);
	}

	/**
	 * the component description
	 */
	public @property string description()
	{
		return Str.toString(gstMpegtsDvbMultilingualComponentItem.description);
	}

	/** Ditto */
	public @property void description(string value)
	{
		gstMpegtsDvbMultilingualComponentItem.description = Str.toStringz(value);
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_dvb_multilingual_component_item_get_type();
	}
}
