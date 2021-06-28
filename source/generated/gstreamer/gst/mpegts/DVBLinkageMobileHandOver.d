module gst.mpegts.DVBLinkageMobileHandOver;

private import glib.MemorySlice;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/** */
public final class DVBLinkageMobileHandOver
{
	/** the main Gtk struct */
	protected GstMpegtsDVBLinkageMobileHandOver* gstMpegtsDVBLinkageMobileHandOver;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsDVBLinkageMobileHandOver* getDVBLinkageMobileHandOverStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsDVBLinkageMobileHandOver;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsDVBLinkageMobileHandOver;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsDVBLinkageMobileHandOver* gstMpegtsDVBLinkageMobileHandOver, bool ownedRef = false)
	{
		this.gstMpegtsDVBLinkageMobileHandOver = gstMpegtsDVBLinkageMobileHandOver;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsDVBLinkageMobileHandOver);
	}


	/** */
	public @property GstMpegtsDVBLinkageHandOverType handOverType()
	{
		return gstMpegtsDVBLinkageMobileHandOver.handOverType;
	}

	/** Ditto */
	public @property void handOverType(GstMpegtsDVBLinkageHandOverType value)
	{
		gstMpegtsDVBLinkageMobileHandOver.handOverType = value;
	}

	/** */
	public @property bool originType()
	{
		return gstMpegtsDVBLinkageMobileHandOver.originType != 0;
	}

	/** Ditto */
	public @property void originType(bool value)
	{
		gstMpegtsDVBLinkageMobileHandOver.originType = value;
	}

	/** */
	public @property ushort networkId()
	{
		return gstMpegtsDVBLinkageMobileHandOver.networkId;
	}

	/** Ditto */
	public @property void networkId(ushort value)
	{
		gstMpegtsDVBLinkageMobileHandOver.networkId = value;
	}

	/** */
	public @property ushort initialServiceId()
	{
		return gstMpegtsDVBLinkageMobileHandOver.initialServiceId;
	}

	/** Ditto */
	public @property void initialServiceId(ushort value)
	{
		gstMpegtsDVBLinkageMobileHandOver.initialServiceId = value;
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_dvb_linkage_mobile_hand_over_get_type();
	}
}
